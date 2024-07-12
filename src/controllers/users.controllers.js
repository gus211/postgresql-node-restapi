import { pool } from "../db.js";

export const getUsers = async (req, res) => {
    const { rows } = await pool.query('SELECT * FROM users');
    res.send(rows);
};

export const getUser = async (req, res) => {
    const {id} = req.params;
    const { rows } = await pool.query('SELECT * FROM users WHERE id = $1', [id]);

    if (rows.length === 0) {
        return res.status(404).json({message: "User not found"});
    }

    res.json(rows[0]);
};

export const createUser = async (req, res) => {
    try {
        const data = req.body;
        const { rows } = await pool.query(
            'INSERT INTO users (country_id, first_name, last_name, username, email, phone_number, birthday, password, description, address) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *', 
            [data.country_id, data.first_name, data.last_name, data.username, data.email, data.phone_number, data.birthday, data.password, data.description, data.address]
        );
        return res.json(rows[0]);
    } catch (error) {
        console.log(error);

        if (error?.code === "23505") {
            return res.status(409).json({ message: "username, email or phone number already exists" });
        }

        return res.status(500).json({ message: "Internal server error" });
    }

};

export const deleteUser = async (req, res) => {
    const { id } = req.params;
    const { rowCount }  = await pool.query('DELETE FROM users WHERE id = $1 RETURNING *', [id]);

    if (rowCount === 0) {
        return res.status(404).json({ message: "User not found"});
    };

    return res.sendStatus(204);
};

export const updateUser = async (req, res) => {
    const { id } = req.params;
    const data = req.body;

    const { rows } = await pool.query('UPDATE users SET country_id = $1, first_name = $2, last_name = $3, username = $4, email = $5, phone_number = $6, birthday = $7, password = $8, profile_photo_id = $9, description = $10, address = $11 WHERE id = $12 RETURNING *', [data.country_id, data.first_name, data.last_name, data.username, data.email, data.phone_number, data.birthday, data.password, data.profile_photo_id, data.description, data.address, id]);

    return res.json(rows[0]);

};